const { get: httpGet } = require('http')
const { get: httpsGet } = require('https')
const { join, basename, normalize } = require('path')
const { writeFile } = require('fs')

function get(url) {
	return new Promise((resolve, reject) => {
		(url.startsWith('https://') ? httpsGet : httpGet)(url, res => {
			res.setEncoding('utf8')

			const data = []
			res.on('data', d => data.push(d))
			res.on('error', reject)
			res.on('end', _ => resolve(data.join('')))
		})
	});
}

get('http://schemastore.org/api/json/catalog.json').then(data => downloadSchemas(JSON.parse(data)))

function downloadSchemas({ schemas }) {
	const promises = []
	for (const schema of schemas) {
		promises.push(
			get(schema.url)
				.then(data => {
					const path = normalize(join(__dirname, 'schemas', basename(schema.name.replace(/ /g, '_'), '.json') + '.json'))
					writeFile(path, data, 'utf8', err => err ? console.error(err) : null)
					return Object.assign(schema, { url: `file://${path}` })
				}).catch(console.error)
		)
	}
	Promise.all(promises).then(data => {
		console.log('Download finished')
		const associations = {}
		for (const { url, fileMatch } of data) {
			for (const file of (fileMatch || [])) {
				associations['/' + file] = [url]
			}
		}
		writeFile('schemas.json', JSON.stringify(associations, null, 2), 'utf8', err => err ? console.error(err) : null)
	})
}

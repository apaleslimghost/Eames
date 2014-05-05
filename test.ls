require! {
	eames: './index.js'
	'karma-sinon-expect'.expect
	'concat-stream'
	σ: 'from'
}

export
	'Miles':
		'should run tasks by the array of files and serve them': (done)->
			spec = task: expect.sinon.stub!
			spec.task.with-args 'file.txt' .returns σ <[ output ]>

			req = url: '/file.txt'
			res = concat-stream (data)->
				expect data .to.be 'output'
				done!

			eames spec, req, res
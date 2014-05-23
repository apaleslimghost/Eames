require! {
	'./index.js'.eames
	'karma-sinon-expect'.expect
	'concat-stream'
	σ: 'from'
}

export
	'Miles':
		'should run tasks by the array of files and serve them': (done)->
			spec = expect.sinon.stub!
			spec.with-args 'file.txt' .returns σ <[ output ]>

			req = url: '/file.txt'
			res = concat-stream (data)->
				expect data .to.be 'output'
				done!

			(eames (-> it), spec) req, res

		'should 404 when there isn\'t a task to run': (done)->
			spec = expect.sinon.stub!
			spec.with-args 'file.txt' .throws new ReferenceError "No such task file.txt"

			req = url: '/file.txt'
			res = concat-stream (data)->
				expect data .to.be 'No such task file.txt'
				expect res .to.have.property \statusCode 404
				done!

			(eames (-> it), spec) req, res

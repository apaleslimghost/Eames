require! \http

eames = (serve, spec)-->
  serve (req, res)->
    try
      spec req.url.slice 1 .pipe res
    catch e
      res.status-code = 404
      res.end e.message

module.exports = eames http.create-server
module.exports.eames = eames

module.exports = (spec, req, res)->
  try
    spec.task req.url.slice 1 .pipe res
  catch
    res.status-code = 404
    res.end!
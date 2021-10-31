var TurndownService = require('turndown')

module.exports = (x) => {
  var turndownService = new TurndownService({headingStyle: "atx", codeBlockStyle: "fenced"})
  var markdown = turndownService.turndown(x)
  return markdown
}
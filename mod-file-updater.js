const versionRegExp = /version="(?<version>.*)"/;

module.exports.readVersion = (contents) => {
  return contents.match(versionRegExp).groups.version;
}

module.exports.writeVersion = (contents, version) => {
  return contents.replace(versionRegExp, `version="${version}"`);
}
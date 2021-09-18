const versionRegExp = /PS_VERSION: "Planet States v(?<version>.*)"/;

module.exports.readVersion = (contents) => {
  return contents.match(versionRegExp).groups.version;
}

module.exports.writeVersion = (contents, version) => {
  return contents.replace(versionRegExp, `PS_VERSION: "Planet States v${version}"`);
}
const fse = require('fs-extra')
const path = require('path')
var fs = require('fs');

var projectRoot
var projectRootMyApp


module.exports = function (context) {
  console.log(context.hook + ': ZYTRUSIT INICIO ')

  projectRoot = path.resolve(path.dirname(context.scriptLocation), '..').split("/").slice(0, -1).join("/")
  projectRootMyApp = projectRoot.split("/").slice(0, -1).join("/")+"/"


  //console.log('path:', path)
  console.log("projectRootMyApp: " + projectRootMyApp)


  console.log('Project root directory:', projectRoot)

  var src = projectRoot + "/captura_facial_plugin/src/ios/lib";
  console.log('soource copy :', src)

 var destino =  path.join(projectRootMyApp, 'platforms', 'ios');
   console.log('destino copy :', destino)


  copyFile(src , src , destino)
}

function copyFile (npmPackage, // oficial name of the npm package from which the file is to be copied from
  fileRelativePath, // file path with respect to the main directory of the npm package (node_modules/<package>/)
  destFilePath) { // file's path to where it is copied, relative to the project bin/ directory
  // trick to get the npm module main directory
  // https://stackoverflow.com/a/49455609/1243247
  const packageDirFullpath = path.dirname(require.resolve(path.join(npmPackage, 'zy_licence_facial.lic')))
  console.log('packageDirFullpath:', packageDirFullpath)
  const fileOriginFullPath = fileRelativePath
    /*console.log('fileOriginFullPath:', fileOriginFullPath)

  const fileDestFullPath = path.join(projectRoot, destFilePath)
    console.log('fileDestFullPath:', fileDestFullPath)*/

  //fse.copySync(fileOriginFullPath, destFilePath)

 fs.createReadStream(fileOriginFullPath).pipe(fs.createWriteStream(destFilePath+"/zy_licence_facial.lic"));

  const consoleMsg = npmPackage + ': ' +
    path.relative(projectRoot, fileOriginFullPath) + ' -> ' +
    path.relative(projectRoot, destFilePath)

  console.log(consoleMsg)
}
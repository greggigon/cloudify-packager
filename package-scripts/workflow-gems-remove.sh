PKG_NAME="workflow-gems"
HOME_DIR="${BASE_DIR}/${PKG_NAME}"

VER_VAR="jruby-1.7.3"

echo "deleting ${PKG_NAME} app dir..."
sudo rm -rf ${BASE_DIR}/${VER_VAR}/
echo "deleting ${PKG_NAME} app dir link..."
sudo rm -rf ${HOME_DIR}
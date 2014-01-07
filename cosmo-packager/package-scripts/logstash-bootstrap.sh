PKG_NAME="logstash"
PKG_DIR="/packages/${PKG_NAME}"
PKG_INIT_DIR="${PKG_DIR}/init"
PKG_CONF_DIR="${PKG_DIR}/conf"

BASE_DIR="/opt"
LOG_FILE="/var/log"
HOME_DIR="${BASE_DIR}/logstash"

VER_VAR="logstash-1.3.2-flatjar"

INIT_DIR="/etc/init"
CONF_DIR="/etc"

echo "creating ${PKG_NAME} application dir..."
sudo mkdir -p ${HOME_DIR}
echo "creating ${PKG_NAME} home dir..."
sudo mkdir -p /home/logstash
echo "moving some stuff around..."
sudo cp ${PKG_INIT_DIR}/${PKG_NAME}.conf ${INIT_DIR}
sudo cp ${PKG_CONF_DIR}/${PKG_NAME}.conf ${CONF_DIR}
sudo cp ${PKG_DIR}/${VER_VAR}.jar ${HOME_DIR}
echo "creating logstash user..."
sudo useradd --shell /usr/sbin/nologin --create-home --home-dir ${HOME_DIR} --groups adm logstash
echo "pwning ${PKG_NAME} file by logstash user..."
sudo chown logstash:logstash ${HOME_DIR}/${VER_VAR}.jar
echo "creating ${PKG_NAME} file link..."
sudo ln -s ${HOME_DIR}/${VER_VAR}.jar ${HOME_DIR}/logstash.jar
echo "creating ${PKG_NAME} logfile..."
sudo touch ${LOG_DIR}/logstash.out
echo "pwning logstash logfile by ${PKG_NAME} user..."
sudo chown logstash:adm ${LOG_DIR}/logstash.out
echo "starting ${PKG_NAME}..."
sudo start logstash

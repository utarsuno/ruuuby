# encoding: UTF-8

# @see https://ruby-doc.org/stdlib-2.6.2/libdoc/socket/rdoc/UNIXSocket.html
class ::UNIXSocket < ::UNIXSocket.superclass
end

# TODO: Docker daemon at unix:///var/run/docker.sock
#  * https://medium.com/better-programming/about-var-run-docker-sock-3bfd276e12fd
#  * https://docs.docker.com/engine/api/v1.27/#section/Errors

# TODO: https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man3/zlib.3.html

# misc look at later:
#  * https://www.ietf.org/rfc/rfc2617.txt

# TODO: document WebRTC (compare with WebSockets)
#  > https://en.wikipedia.org/wiki/WebRTC
#  > https://webrtc.org/

# ----------------------------------------------------------------------------------------
# ___  ___        __           __   __       ___    __            __        __
#  |  |__   |\/| |__)    |    /  \ /  `  /\   |  | /  \ |\ | .   /  ` |  | |__) |
#  |  |___  |  | |       |___ \__/ \__, /~~\  |  | \__/ | \| .   \__, \__/ |  \ |___
#
# ----------------------------------------------------------------------------------------

# @see https://www.cyberciti.biz/faq/download-a-file-with-curl-on-linux-unix-command-line/
#
# @param [String] url_resource
# @param [String] optional_save_as_path
#def curl_get(url_resource, optional_save_as_path='')
#  🛑strs❓([url_resource, optional_save_as_path])
#  if optional_save_as_path.∅?
#    self.run_cmd("curl -L -O #{url_resource}")
#  else
#    self.run_cmd("curl -L #{url_resource} --output #{optional_save_as_path}")
#  end
#end

(ql:quickload :swank)
(setf swank::*loopback-interface* "0.0.0.0")
(swank:create-server :port 6005 :dont-close t :style :spawn)

(defpackage :hunter-system
  (:use :cl))

(in-package :hunter-system)

(asdf:defsystem :treasure-hunter
  :depends-on (:lbge
               :objective-cl
               :alexandria)
  :around-compile (lambda (next)
                    (uiop:symbol-call '#:objective-cl '#:enable)
                    (unwind-protect (funcall next)
                      (uiop:symbol-call '#:objective-cl '#:disable)))
  :components
  ((:file "tileset")
   (:file "main")))

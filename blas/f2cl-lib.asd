#+sbcl
(declaim (sb-ext:muffle-conditions sb-kernel:character-decoding-error-in-comment))

(defpackage :clml.blas-environment (:use :cl :asdf))
(in-package :clml.blas-environment)

(defun call-with-environment (fun)
  (let ((*read-default-float-format* 'double-float))
    (funcall fun)))

(asdf:defsystem :f2cl-lib
  :pathname "src/"
  :around-compile call-with-environment  
  :serial t
  :components ((:file "package")
               (:file "macro"))
  )

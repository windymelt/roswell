#+sbcl(setf sb-impl::*default-external-format* :utf-8)
#+sbcl(setf sb-alien::*default-c-string-external-format* :utf-8)

#+ccl(setf ccl:*default-external-format*
           (ccl:make-external-format :character-encoding :utf-8
                                     :line-termination :unix)
           ccl:*default-file-character-encoding* :utf-8
           ccl:*default-socket-character-encoding* :utf-8)

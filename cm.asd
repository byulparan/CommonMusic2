;;; **********************************************************************
;;; Copyright (C) 2005 Heinrich Taube, <taube (at) uiuc (dot) edu>
;;;
;;; This program is free software; you can redistribute it and/or
;;; modify it under the terms of the Lisp Lesser Gnu Public License.
;;; See http://www.cliki.net/LLGPL for the text of this agreement.
;;; **********************************************************************

;;; $Name:  $
;;; $Revision: 1.38 $
;;; $Date: 2007/01/05 21:46:36 $

(in-package :cl-user)

#-(or allegro clisp cmu lispworks openmcl sbcl ecl)
(error "Sorry, Common Music does not run in this Lisp.")

;;;
;;; system definition
;;;
(asdf:defsystem :cm
  :description "Common Music"
  :version "2.7.0"
  :author "Rick Taube <taube (at) uiuc.edu>"
  :licence "LLGPL"
  :components
  ((:module "src"
    :components (
		 (:file "pkg")
		 (:file "iter")
		 #+allegro (:file "acl" :depends-on ("pkg"))
		 #+clisp (:file "clisp" :depends-on ("pkg"))
		 #+cmu (:file "cmu" :depends-on ("pkg"))
		 #+ecl (:file "ecl" :depends-on ("pkg"))
		 #+lispworks (:file "lispworks" :depends-on ("pkg"))
		 #+ccl (:file "openmcl" :depends-on ("pkg"))
		 #+sbcl (:file "sbcl" :depends-on ("pkg"))
		 (:file "level1" 
		  :depends-on ("pkg" #+allegro "acl"
				     #+clisp "clisp"
				     #+cmu "cmu"
				     #+ecl "ecl"
				     #+lispworks "lispworks"
				     #+(and mcl (not openmcl)) 
				     "mcl"
				     #+openmcl "openmcl"
				     #+sbcl "sbcl"
				     "iter"))
		 (:file "clos" :depends-on ("level1"))
		 (:file "utils" :depends-on ("level1"))
		 (:file "mop" :depends-on ("clos" "utils"))
		 (:file "objects" :depends-on ("mop" "iter" "utils"))
		 (:file "data" :depends-on ("utils"))
		 (:file "scales" :depends-on ("data" "objects"))
		 (:file "spectral" :depends-on ("data"))
		 (:file "patterns" :depends-on ("scales"))))))

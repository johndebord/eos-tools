;; find "N(" string
;;
;; if no "N(" string found
;;   Send "No \"N(\" strings found in the minibuffer"
;;   quit
;;
;; else
;;   save where the cursor lands in memory
;;
;;   determine if it's more than one word or not:
;;     if following word conditions; two words:
;;       "a-word"
;;       "a_word"
;;       "a.word"
;;     else; one word
;;       "aword"
;;       "aWord"
;;
;;   save how many words there are in memory
;;
;;   do the following sequence to replace the "N(" macro:
;;     1) delete-backward * 2
;;     2) select-word-forward * numOfWords
;;     3) double-quotes * 1
;;     4) forward-character * 1
;;     5) insert "_n" * 1
;;     6) increment the count
;;
;;   if no "N(" string found
;;     Send "\"N(\" changes found: %d"
;;     quit

(defun jd:replace-n-macro-error ()
  (interactive)
  (message "No \"N(\" strings found."))

(defun jd:replace-n-macro()
  (interactive)
  (search-forward "N(" jd:replace-n-macro-error))

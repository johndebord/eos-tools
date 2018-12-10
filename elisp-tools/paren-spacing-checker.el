;; RATIONALE
;; ---------
;; This elisp function will be used for quickly reformatting the eos codebase to fit its
;; style patterns for better readability
;;
;; ALGORITHM DESCRIPTION
;; ---------------------
;; Go forward an expression until cursor lands on an open-paren or just after a close-paren
;;
;; If the cursor lands on an open-paren  prompt the user if a space should be added
;; If the cursor lands on an close-paren prompt the user if a space should be added
;;
;; open-paren-function:
;;     go forward one character
;;     insert one space character
;;
;; close-paren-function:
;;     go backward one character
;;     insert one space character
;;     go forward one character

(defun open-paren-edit ()
  (interactive)
  (forward-char)
  (insert-char #x20)
  )

(defun close-paren-edit ()
  (interactive)
  (backward-char)
  (insert-char #x20)
  (forward-char)
  )

(defun prompt-user-for-open-paren-edit ()
  (interactive)
  (if (y-or-n-p "Insert space?")
      (open-paren-edit)
    )
  )

(defun prompt-user-for-close-paren-edit ()
  (interactive)
  (if (y-or-n-p "Insert space?")
      (close-paren-edit)
    )
  )

(defun paren-spacing-edit ()
  (interactive)
  (search-forward-regexp (rx (or "(" ")")))
  (cond ((eq (char-before) #x28)
         (prompt-user-for-open-paren-edit))
        ((eq (char-before) #x29)
         (prompt-user-for-close-paren-edit))
        )
  )

;Aman Seth, CMPUT 325, 1394136

;QUESTION 1
; What does the function do: This function tests to see if the first argument (X) is part of the 2nd argument (Y) list
; How does this function work: It checks if the first element of the list argument Y matches the argument X (returning true if it does), and if it 
;doesn't, then it recursively calls the same function again, but with the arguments modified, with the first arguement X unchanged, while the 
;first element of the list argument Y removed, thus iteratively checking the entire list. If the list Y happens to be null or empty, 
;the function will return false   
(defun xmember (X Y)
	(cond
		((null Y) NIL)
		((equal X (car Y)) T)
		(T (xmember X (cdr Y)))
		)
)



;QUESTION 2
; What does the function do: This function 	goes through each element of the list argument X, and appends each 'atom' (character) in the output list
;This allows the output to get rid of unneccesary bracks and nested lists
; How does this function work: this function checks if the first element if the list is an atom (not a list), and if it is, itll append that to the 
;output list, as well as recursively run the function on the same argument list minus the first element. If the first element is a list, then the function
;will append the (recursive) output of the function call on the first element of the output list, as well as append the output of the (recursive) function
;call on the argument list minus the first element 

(defun flatten (X)
	(cond
		((null X) NIL)

		((atom (car X)) (append(list(car X))(flatten (cdr X))))
		
		(t (append(flatten (car X))(flatten (cdr X))))
		)
)


;QUESTION 3
; What does the function do: this function removes all duplicates of any elements, thus each element of the output list is unique
; How does this function work: this function first checks to see if the first element of the argument list exists anywhere else in the list, and 
;if it does, itll just call the function again, but with the arguement list minus the first element. In the case that there no other duplicate of 
;the first element of the list, itll append the element, and then (recursively) call the function on the rest of the list
(defun remove-duplicate (X)
	(cond
		((null X) NIL)

		((xmember (car X) (cdr X)) (append(remove-duplicate(cdr X))))
				
		(t (append(list(car X))(remove-duplicate(cdr X))))
		)
)


;QUESTION 4
; What does the function do: this function outputs the elements of each list arguments one by one, until one runs out, then itll output all 
;remaining ones in order
; How does this function work: This function appends the first element of the first argument list, then recursively calls the function again,
;but swapping the arguments and without the appended element 
(defun mix (X Y)
	(cond
		((null X) (append Y))
		((null Y) (append X))
		(t (append(list(car X))(mix Y (cdr X))))
	)
)


;QUESTION 5
; What does this function do: This function generates all possible subsets of the given argument, using the gen-subsets function, which
;uses the same argument plus 'cons nil nil', which is a subset of all of any set 
(defun allsubsets (L)
	(gen-subsets (cons nil nil) L)
)

; What does this function do: This function generates all possible subsets of the given argumen. It checks to see if the second argument is empty
;which will append the first arguement to the output and the operation. If not, then itll append the output of the (recursive) function call with
;the same arguments minus the first element of the second arguemnt, as well as append the output of the (recursive) function call with the 
;first argument being a list containing (L1 or nil, depending on the value of L1) and first element of L2, and the second argument being the 
;rest of L2

;note: This function was generated with the help of a TA on the board in a lab
(defun gen-subsets (L1 L2)
	(cond 
		((NULL L2) (list L1))

		(t(append 
			(gen-subsets L1 (cdr L2)) 
			(gen-subsets 
				(append 
					(if (equal L1 '(nil)) nil L1) 
					(list(car L2))
				) 
				(cdr L2)
			)

			)
		)
	)
)




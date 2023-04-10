if __name__ == '__main__':
    s = input()

    letters_set = (set(s))

    # iterating through all the letters
    letter_dict = {}
    for letter in letters_set:
        count_letter = 0
        for char in s:
            if char == letter:
                count_letter += 1
        letter_dict[letter] = count_letter

    # or more efficiently
    letter_dict2 = {letter: s.count(letter) for letter in letters_set}
    
    # Sort the dictionary according to 1st) value and 2nd) key 
    sorted_dict = sorted(letter_dict2.items(), key=lambda x: (-x[1], x[0]), reverse = False)

    top_3 = sorted_dict[:3]
    for item in top_3:
        print(item[0], item[1])

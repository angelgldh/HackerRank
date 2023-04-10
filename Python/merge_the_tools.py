def merge_the_tools(string, k):
    # your code goes here
    # Less efficient approach 
    substrings = []
    for ii in range(0,len(string),k):
        substr = (string[ii:ii + k])
        unique_chars = ""
        for char in substr:
            if char not in unique_chars:
                unique_chars += char
        print(unique_chars)
    
    # Using list comprehesion, join and sets to make it more efficient
    substrings = [string[i:i + k] for i in range(0, len(string), k)]
    for substr in substrings:
        unique_chars = "".join(sorted(set(substr), key=substr.index))
        print(unique_chars)

if __name__ == '__main__':
    string, k = input(), int(input())
    merge_the_tools(string, k)

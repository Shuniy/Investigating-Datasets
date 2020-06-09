#!/usr/bin/python

from nltk.stem.snowball import SnowballStemmer
import string

sys.path.append("D:/ud120-projects/")

def parseOutText(f):
    """ given an opened email file f, parse out all text below the
        metadata block at the top
        (in Part 2, you will also add stemming capabilities)
        and return a string that contains all the words
        in the email (space-separated) 
        
        example use case:
        f = open("email_file_name.txt", "r")
        text = parseOutText(f)
        
        """


    f.seek(0)  ### go back to beginning of file (annoying)
    all_text = f.read()

    ### split off metadata
    content = all_text.split("X-FileName:")
    words = ""
    if len(content) > 1:
        ### remove punctuation
        from nltk.stem import SnowballStemmer
        text_string = content[1].translate(
            string.maketrans("", ""), string.punctuation)
        stemmer = SnowballStemmer("english")
        splitted_words = text_string.split()
        stemmed_sentence = []
        for word in splitted_words:
            stemmed_word = stemmer.stem(word)
            stemmed_sentence.append(stemmed_word)
        words = string.join(stemmed_sentence, " ")
        ### project part 2: comment out the line below
        # words = text_string

        ### split the text string into individual words, stem each word,
        ### and append the stemmed word to words (make sure there's a single
        ### space between each stemmed word)




    return words

    

def main():
    ff = open("text_learning/test_email.txt", "r")
    text = parseOutText(ff)
    print (text)



if __name__ == '__main__':
    main()


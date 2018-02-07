def main():
    in_file = open("tale_of_two_cities.txt","r")
    allwords=open("allwords.txt","w")
    unique=open("uniquewords.txt","w")
    freq=open("wordfrequency.txt","w")
    for line in in_file:
        wordlist=line.split()
        for word in wordlist:
            word=word.lower()
            writeword=''
            for character in word:
                if character.isalpha():
                    writeword+=character
            allwords.write(writeword+'\n')
            
    allwords.close()
    unique.close()
    freq.close()
main()

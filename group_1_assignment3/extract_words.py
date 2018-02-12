def main():
    uniquedict = dict();
    in_file = open("tale_of_two_cities.txt","r")
    allwords=open("allwords.txt","w")
    
    unique=open("a3_novelvisualization/uniquewords.txt","w")
    uniquecopy=open("a3_wordfrequency/uniquewords.txt","w")
    freq=open("a3_wordfrequency/wordfrequency.txt","w")
    for line in in_file:
        wordlist=line.split()
        for word in wordlist:
            word=word.lower()
            writeword=''
            for character in word:
                if character.isalpha():
                    writeword+=character
            allwords.write(writeword+'\n')
            if writeword in uniquedict:
                uniquedict[writeword]+=1
            else:
                uniquedict[writeword]=1
                unique.write(writeword+'\n')
                uniquecopy.write(writeword+'\n')
                
            
    valuelist=list(set(uniquedict.values()))
    valuelist.sort()


    for i in valuelist:
        count=0
        for key in uniquedict:
            if uniquedict[key]>=i:
                count+=1
        freq.write(str(i)+": "+ str(count)+'\n')
    allwords.close()
    unique.close()
    freq.close()
main()

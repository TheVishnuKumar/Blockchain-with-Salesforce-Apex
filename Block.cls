/*
The MIT License

Copyright (c) 2010-2018 Vishnu Kumar, Inc. http://0to1code.com/

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/
public class Block{
    public integer index;
    public long timestamp;
    public string data;
    public string prevHash;
    public string hash;
    
    public Block(integer index, string data, string prevHash){
        this.index = index;
        this.timestamp = generateTimeStamp();
        this.data = data;
        this.prevHash = prevHash;
        this.hash = this.getHash();
    }

    private long generateTimeStamp(){
        return DateTime.Now().getTime();
    }
    
    public string getHash(){                                
        Blob dataToEncrypt = Blob.valueOf( this.data + this.prevHash + this.index + this.timestamp );
        Blob encrypted = crypto.generateMac('HmacSHA256', dataToEncrypt, Blob.valueOf('0to1Code'));
        
        return EncodingUtil.base64Encode(encrypted);
    }
}

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
@isTest
public class BlockChainTest{

    //Testing Blockchain 
    @isTest
    public static void testBlockChain(){
        /**Data Setup**/
        
        //Creating Instance of Blockchain
        BlockChain bChain = new BlockChain();
    
        //addBlock method take data as the string
        //Changing data to the string with the JSON format
        
        //Adding the first block to the chain
        bChain.addBlock( json.serialize( new BCTestDataWrapper('Iron Man', '2334343434') ) );
        
        //Adding the second block to the chain
        bChain.addBlock( json.serialize( new BCTestDataWrapper('Thor', '34343434') ) );
        
        
        /**Positive Testing**/
        
        //isChainValid will return true, as no data has been modified from block
        system.assertEquals(true, bChain.isChainValid() );
        
        //Print Blockchain
        system.debug('-Blockchain Data Before Modifying--'+Json.serialize( bChain.chain) );
        
        
        /**Negative Testing**/
        
        //Now updating the 0 index's block
        BCTestDataWrapper tData = (BCTestDataWrapper)JSON.deserialize(bChain.chain[0].data, BCTestDataWrapper.class);
        tData.name = 'Thanos';
        bChain.chain[0].data = json.serialize(tData);
        
        //isChainValid will return false, as the data has been modified from block
        system.assertEquals(false, bChain.isChainValid() );
        
        //Print Blockchain
        system.debug('-Blockchain Data After Modifying--'+Json.serialize( bChain.chain) );
    }
}

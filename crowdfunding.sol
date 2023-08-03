//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.8.1 <0.9.0;

contract donate{

    address public admin;
    mapping(address => uint) balances; //bunu private yaparsın
    mapping(address => bool) is_participated;
    uint how_many_person;

    enum state {Not_opened,Running,Closed,Not_Reached}
    state public status;

    uint total_participate;

    string selectedfoundation;

    struct Foundations_Company {
    string name;
    uint voted_people;
    address wallet; }

    Foundations_Company losev = Foundations_Company("losev",0,payable(0x2787b58E6c7c9e0C824f2187BA99a2076B23491c));
    Foundations_Company mehmetcik = Foundations_Company("mehmetcik",0,payable(0x2787b58E6c7c9e0C824f2187BA99a2076B23491c)); 
    Foundations_Company kizilay = Foundations_Company("kizilay",0,payable(0x2787b58E6c7c9e0C824f2187BA99a2076B23491c));

    





   

   

    uint firstBlock;
    uint lastBlock;

    uint aimDonation = 0.3 ether;

    


    constructor(){ //2 blok
        admin=msg.sender;
        status=state.Running;
        firstBlock = block.number;
        lastBlock = firstBlock + 2;
        
        
    }

    modifier onlyAdmin(){
        require(msg.sender==admin,"You are not admin! You cant do that!!");
        _;
    }

    function get_Balance()public view returns(uint){
        return balances[msg.sender];
    }

    function person_counter() onlyAdmin() public view returns(uint){
        return how_many_person;
    }

    function get_Balance_global() onlyAdmin() public view returns(uint){
        
        return address(this).balance;
    }

    function donateOption() public pure returns(string memory){
        string memory options = "We have 3 option : 1=losev,2=mehmetcik,3=kizilay";
        return options;
    }

   



    function sendDonate() payable public{

        if (balances[msg.sender]==0){
            how_many_person++;
            balances[msg.sender]=msg.value;
        }
        else {
            balances[msg.sender] = msg.value + balances[msg.sender];
        }
    }

    function where_to_donate(uint i) public{
        require(i<4 && i>0,"We have 3 option : 1=losev,2=mehmetcik,3=kizilay"); //If someone has a balance greater than 0.1 ETH, they have the right to cast two votes instead of one.
        require(is_participated[msg.sender]==false && balances[msg.sender] > 0,"You have already participated to donated or you dont have money");
        if (i==1){
            total_participate++;
            if (balances[msg.sender]>= 0.1 ether){
                losev.voted_people++;
            }
            losev.voted_people++;
            is_participated[msg.sender] = true;
        }
        else if (i==2){
            total_participate++;
            if (balances[msg.sender]>= 0.1 ether){
                mehmetcik.voted_people++;
            }
            mehmetcik.voted_people++;
            is_participated[msg.sender] = true;
        }
        else if (i==3){
            total_participate++;
            if (balances[msg.sender]>= 0.1 ether){
                kizilay.voted_people++;
            }
            kizilay.voted_people++;
            is_participated[msg.sender] = true;
        }
    }

     function chooseMax() private returns (string memory) {
        if (losev.voted_people>mehmetcik.voted_people && losev.voted_people>kizilay.voted_people){
           payable(losev.wallet).transfer(address(this).balance);
           return "Donations has been succesfully sent to losev";
        }
        else if (mehmetcik.voted_people>losev.voted_people && mehmetcik.voted_people>kizilay.voted_people){
            payable(mehmetcik.wallet).transfer(address(this).balance);
            return "Donations has been succesfully sent to mehmetcik";
        }
        else if (kizilay.voted_people>losev.voted_people && kizilay.voted_people>mehmetcik.voted_people){
            payable(mehmetcik.wallet).transfer(address(this).balance);
            return "Donations has been succesfully sent to kizilay";
        }
        return "error";
        
    }


    function finalize() public onlyAdmin() returns(string memory){
        require((how_many_person/2) > total_participate || block.number >= lastBlock,"Error code:1");
        string memory result = chooseMax();
        return result;

       
        





    }
    








}
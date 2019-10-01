# CarAuction
Rutger CS336 Project

RUTGERS CS336 PROJECT
GROUP 33: Junjie He(jh1285) Part 4, Ze Cui(zc169) Part 1 and 5, Hanqing Zhao(hz298) Part 3, Xinyu Du(xd59) Part 2
Porject Topic: CAR AUCTION
URL: http://ec2-18-217-28-6.us-east-2.compute.amazonaws.com:8080/ProjectFinal
Tomcat UserName:tsui   Password:971009
Apportions List:
Junjie He(jh1285){
answer.jsp
likes.jsp
question.jsp
SearchQuestion.jsp
SearchQuestionbyKeyWord.jsp
SearchQuestionbyNOTAnswered.jsp
SearchQuestionbyQuestioner.jsp
styleHome.css
stylelogin.css
success.jsp(General Question part, Alert part, and Set Notification part)
}
Hanqing Zhao(hz298):
{
search.jsp
detail.jsp
Success.jsp(auction search part)
}
Xinyu Du(xd59){
Wrtie a part of readme and do nothing
}
Ze Cui(zc169){
Changeauction.jsp
Changeauction.html
Changeuserinfo.jsp
Changeuserinfo.html
index.html
login.html
login.jsp
logout.jsp
salesreport.jsp
signup.jsp
signup.html
signupcr.html
signupcr.jsp
}


Part 1&5{ Programmer: Ze Cui

I take part (I)(V) as my duty. 
In this project I create three different table name: account ,admin and cr for three different kinds of users. account keep track of the normal costumer; admin keep record of admin of this website which is already implemented which are: (userid= 001, pwd= 971009) (userid= 002, pwd= admin)and(userid= 003,pwd= admin); cr corresponding to customer representative. These three table take will be frequently used in login and logout.

in the login page, users have to choose which identity they want to use, either "user","cr" or "admin". This will automatically set a session-attribute "user type", which will record the identity users used to login, and based on their identity, showing different things in the home page. 

Costumer representatives have the rights to change user information and auction information, so, for "cr", I provided links to "change auction.html" and "change userinfo.html" which function as the name suggested. A thing to be reminded, since the guy doing "auction" part has not finished his job, I could not track the history of an auction, that means if cr delete the latest "highest bidder", I could not get the record of second-highest bidder. So, the functionality of delete bid is banned. However, cr could change current bid and Minimum Increment or even delete the auction. CR also has the right to answer question to user. 

Admins have the access to generate sales report and the right to create CR account. About the sales report, I want to mention that our website is just an intermediary, we do not start an auction. So, the income is all base on the service fee which is 2% from each deal.
}

Part 2:{ Programmer: Xinyu Du
auctionManager.jsp will create and delete the editauction from user. 
bidManager.jsp will create and delete the editBid.jsp from user.
creatAuctionHandler.jsp will catch the data from Auction and User. The data like car_vin, car_name,pic_link, initial_price, increment, min_sell_price(which one is hidden),
item_description, category_name, subcategory_name, end_date,seller_id will be received. 
createAuctionPage.jsp will check the user is null or not.If the user is null, the web will shows "It must be logged in to sell an item. Please login or create an account."
Then give the user login and register button wich linked to login.jsp and register.jsp.
If the use is not null, then it will leader user to AuctionHandler page which ask user to type in car_vin, car_name, pic_link, initial_price, min_sell_price(which one is hidden), increment,
item_description,category_name, subcategory_name, end_date. Then save these data.
createBidHandler.jsp  request bid_amount, auction_id and user_id. Try price is the bid is greater than the previous bid by the increment or not. If not, the web shows
"There was an error. Your bid must be at least greater than the previous bid by the increment specified. Please go back and try again." 
deleteAuction.jsp will delete the auction using auction_id from user.
deleteBid.jsp will delete the using bid from user.
editAuction.jsp will creat a auction from user by asking user type in car_vin, car_name,pic_link, initial_price, increment, min_sell_price(which one is hidden),
item_description, category_name, subcategory_name, end_date.
editBid.jsp create bid and ask user type in auction_id, bid_id, user_id, price and up_limit(which is automatically bid for user).
auctionDone.jsp will check the auction is finished or not.When the closing time ends, it checks there is a winner or not. If highest_bid_price is higher than min_sell_price, there is winner.
If highest_bid_price is lower than min_sell_price, there is no winner.
}

Part 3:{ Programmer: Hanqing Zhao
1锛歎sers could use the auction search to search auctions by various criterias{Brand,Year,Type,Mileage and condition). When the user select all the criterias they want, then click the search botton and the web will relink to a new page named search.
2: In the search page, it will shows the result of search based on criterias the users selected. If there is no auction match. This page will tells users that "Sorry, There is no car they want". 
If the system could find the matched auction, the result will showed as a table. In this table, there would be AuctionID, Brand, Type, Year,Mileage, CurrentBid and EndTime of the auction.
In the end of each row of auction. There is a button which could relink to detail page which show details of the auction.
Under the result, there is a link that helps users to go back to home page. In there, They can search other auctions or problems.
3: In detail page, the result will also show like a table. But this table is more specific, except the information of table in search page, this table will show who is the seller, Model of the vehicle and Number of bids for this auction.
And this page will also find other auctions that similar with this auction from our database. But if there is no other auctions that are similar, there would show users that "No more recommandations".
Under the recommandations, there also has a link that helps users go bak to the home page.

Because one of our groups who in charge of the auction part still not finish his part. So the auction search can not lead users to the page of auctions from search page and detail page.
}

Part 4(Alerts and Messaging functions){ Programmer: Junjie He
    In this part, I built 3 sections for this auction website.
    Section 1{
        Alert system.
        In the auction table, if the HighestBidderName column is updated, the old highest bidder should be notified. Therefore, I create a trigger to insert the old highest bidder's information in the auction into Alert table, if the HighestBidderName column is updated. For example, If Allen attended an auction, and his bid is surpassed by someone else, the auction ID, car's brand, car's year, Current bid, Allen's name, his email and his Upper limit(if exist) will be inserted into Alert table. 
        In the future, the system will automatically send emails to notify users that they are out of the bid.
        For now, if the user who is going to be notified logs in the auction website, an alert window (written in JavaScript) will show after logged in. 
        Additionally, a part of Alert table related to the user will show more details about the auction on the home page.
        If the user set up the automatic bid:
        1. The alert message will show: "Dear Customer, Your Upper Limit was surpassed!\tYou can increase your Upper Limit of bid or just give up."
        2. The OldUpperLimit column in the Alert table will contain the value of the user's old UpperLimit
        Because my team member does not finish the auction part, TA or GA can test this section by logging in as user
        Username: testOne
        Password: 123
        If the user did not set up the automatic bid:
        1. The alert message will show: "Dear Customer, Your Upper Limit was surpassed!\tYou can increase your Upper Limit of bid or just give up."
        2. The OldUpperLimit column in the Alert table is null;
        Because my team member does not finish the auction part, TA or GA can test this section by logging in as user
        Username: Ada
        Password: 123
        After the user got alert, the rows related to the user would be deleted from "Alter" table.
        Therefore, the user would only be alerted once. If the user logs in again, he or she would not be notified.
    }
    Section 2{
        Questions system.
        In the home page, users can see the General Question table. The primary key of this table is QuestionID, which is automatically created by the system. The table is public to everyone who can log in.
        Users can browse questions and answers in the table. If the question is not answered, the Answer column should be "NOT ANSWERED". Users can post their question by entering the AuctionID and their Question into the box below the table.
        Users can search the questions by Keyword of their question, AuctionID, Questioner. Users can post new questions on the search page directly. Additionally, there is a function to show the questions that are not answered yet. CR(Customer Representative) can find no answered questions quickly. 
        TA or GA can test this section by logging in as user
        Username: Aiya
        Password: 123
        Exceptions:
        1. Search by keyword: if the user types nothing in the box, and click the "Seach" button directly, the system will show the whole table.
        2. Search by keyword: if the user types the keywords which are not contained in the posted question, the system will show the alert message: "No question relates to such keyword!".
        3. Search by auction: if the user types an auction ID that does not exist or no question relates to this auction ID, the Search page will show "This Auction ID does not exist or NO question relates to this auction!"
        4. Search by Questioner: if the user types a questioner ID that does not exist or no question relates to this questioner ID, the system will show the alert message: "This Questioner does not exist or NO question relates to this Questioner!"
    }
    Section 3{
        Notification system.
        User can set an alert for specific items s/he is interested. For example, the user can get an alert when the item becomes available after she or he set the Notification.
        After the user set the Notification, the user's information will be inserted into the "likes" table.
        In the future, the system will automatically send emails to notify users that their interesting cars are available.
        For now, the user can be notified after they log in.
        Like the Alert system, the Notification will only occur once. If the user who already get notified log in again without set new Notification, the user will not be bothered. 
        Exception:
        The system will alert users if they enter the invalid Auction ID.
        TA or GA can test this section by logging in as user
        Username: Allen
        Password: 123
    }
}

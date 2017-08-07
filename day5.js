/* ES5 */
//creates a variable and sets it to a boolean value
var isMomHappy = false;

// Promise
// Creates a variable with the Promise function willIGetNewPhone which contains
// the parameters of resolve, reject. The if else loop create the variable "phone"
// and sets it to the properties of Samsung, black if resolved.
// The else section creates the reason variable and creates a new Error message,
// set to 'mom is not happy'. Then it calls the reject function and it's reason.

var willIGetNewPhone = new Promise(
    function (resolve, reject) {
        if (isMomHappy) {
            var phone = {
                brand: 'Samsung',
                color: 'black',
                fanciness: 10
            };
            resolve(phone); // fulfilled
        } else {
            var reason = new Error('mom is not happy');
            reject(reason); // reject
        }

    }
);

// call our promise
// We call the promist with the var askMom, set to a functdion that calls
// willIGetNewPhone which after called is .then fulfulled, and sent to console.log

var askMom = function () {
    willIGetNewPhone
        .then(function (fulfilled) {
            // yay, you got a new phone
            console.log(fulfilled);
         // output: { brand: 'Samsung', color: 'black' }
        })
        .catch(function (error) {
            // oops, mom don't buy it
            console.log(error.message);
         // output: 'mom is not happy'
        });
};

askMom();

// Broken Version below

var isMomHappy = true;

var willIGetNewPhone = new Promise(
    function (res, rej) {
        if (isMomHappy) {
            var phone = {
                brand: 'Samsung',
                color: 'black',
                fanciness: 10
            };
            res(phone); // fulfilled
        } else {
            var reason = new Error('mom is not happy');
            rej(reason); // reject
        }

    }
);

var askMom = function () {
    willIGetNewPhone
        .then(function (phone) {
            // yay, you got a new phone
            console.log(phone);
			console.log(phone.fanciness)
         // output: { brand: 'Samsung', color: 'black' }
        })
		.then(function (response) {
            // yay, you got a new phone
			console.log(phone);
            if(phone.fanciness > 5){
              console.log("thanks for the super fancy phone")
            }
         // output: { brand: 'Samsung', color: 'black' }
        })
		.catch(function (error) {
            // oops, mom don't buy it
            console.log(error.message);
         // output: 'mom is not happy'
        });

};

askMom();

//New Promise example

var isBuddyReturningMoney = false;

var willIGetMyMoney = new Promise(
    function (yes, no) {
        if (isBuddyReturningMoney) {
            var answer = 'Yes, you will get your money back';
            yes(answer); // fulfilled
        } else {
            var reason = new Error('Buddy is not happy, and will not return your money');
            no(reason); // reject
        }

    }
);

var askBuddy = function () {
    willIGetMyMoney
        .then(function (fulfilled) {
            console.log(fulfilled);
        })
        .catch(function (error) {
            console.log(error.message);
        });
};


askBuddy();

## Clearbit Support Engineering Take Home Assignment


### Please answer as much of this take home as you can in a maximum of 2 hours. Please return this assignment within 4 calendar days of receiving it.



## Part A - Customer Communication

Write a response to both of these customer prompts as if you were responding to an actual customer:

1. “Looking for API access. I would submit a domain name, looking for email address of founder or CEO. Is this Enrichment or Prospector? Please help me sign up for the right plan. Thanks, Dave”


  Hi Dave,
Our Prospector API is best suited to your needs, allowing you to find the email address for founder or CEO (and other roles) based on a domain name you submit. That API is available through our Enterprise plan. Is there additional data that would help you with your prospecting? If you are ready to sign up,  I’ll pass you off to our success team (success@clearbit.com) to take care of your registration information. I am happy to help with any other questions or issues that you may have!
  All the best,
  Phillip



2. “Reveal API was working correctly a month ago, however I noticed the number of company identifications seem to have dropped dramatically in the last week. Can your team please help take a look?


  Good morning,
  Happy to help! Can you provide a bit more information:
  * To be clear, the number of IP addresses you have been submitting is the same, but you have received more 404 status responses?
  * What is your account name?  

Thanks,
Phillip


## Part B - Documentation
A major part of the Support Engineering role involves self-sufficiency and being able to troubleshoot answers that are (and sometimes are not) readily available. Many of the answers for the following questions can be found in: https://clearbit.com/docs, and some might not.

1. What is our non-streaming API rate limit?
  *  600 requests per minute

2. Which requests count against a customers quota for the Enrichment API?
  * Unique requests (within a 30 day period count) against the quota. If a request is repeated it does not count

3. Which of these is a valid revenue range?
  * $1M-$10M - Correct formatting but it does need to be a string, e.g. `“$1M-$10M”`
  * $1,000,000-$10,000,000
  * 1-10M
  * 1000000-10000000
  * All are valid
  * None are valid




## Part C - Code

1. Write a script that will replace all image tags on clearbit.com with a picture of your favorite dog.

```js
function replaceImageTags() {
  let images = document.getElementsByTagName('img');

  images.forEach(image => {
    image.setAttribute('src', "https://dogtime.com/assets/uploads/gallery/shiba-inu-dog-breed-picutres/3-overshoulder.jpg")
  });
};
```

2. Write a script that takes this list of company names, dedupes them, and runs against our name to domain api, returning the domains. Provide the before and after CSV.

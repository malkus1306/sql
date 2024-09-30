# Assignment 1: Design a Logical Model
Student: Ivan Makushenko

## Question 1
Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).
![bookstore_Q1](https://github.com/user-attachments/assets/c9f4496f-60c6-4e16-813d-7b5dfacc445f)



## Question 2
We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.
![bookstore_Q2](https://github.com/user-attachments/assets/a5a04ccd-0296-40a0-9257-0f13bbb2926a)




## Question 3
The store wants to keep customer addresses. Propose two architectures for the CUSTOMER_ADDRESS table, one that will retain changes, and another that will overwrite. Which is type 1, which is type 2?

_Hint, search type 1 vs type 2 slowly changing dimensions._
Design for Customer Addresses table would retain changes:
This is Type 2 SCD:
customer_id (PK)
customer_address_line1
customer_address_line2
customer_city
customer_province
customer_postal_code
effective_date (FK) /* identifies the date when address was changed */
current_flag /* identifies the actual vs. past addresses */

Design for Customer Addresses table would overwrite changes:
This is Type 1 SCD:
customer_id (PK)
customer_address_line1
customer_address_line2
customer_city
customer_province
customer_postal_code

Bonus: Are there privacy implications to this, why or why not?
```
Your answer...
```
Adding customer addresses to the database presents potential privacy risks. In the event of a data breach, the combination of address details and customer names could be exploited for fraudulent activities, such as social engineering or other criminal schemes. Retaining a history of address changes (Type 2) introduces additional privacy concerns, as it stores sensitive information over time, increasing the exposure in case of unauthorized access. On the other hand, using an overwrite approach (Type 1) risks losing important data related to customer behavior and poses challenges in tracing errors or changes, which could lead to inaccuracies. This creates a tradeoff between minimizing privacy risks and maintaining data integrity.  

## Question 4
Review the AdventureWorks Schema [here](https://i.stack.imgur.com/LMu4W.gif)

Highlight at least two differences between it and your ERD. Would you change anything in yours?
```
Your answer...
```
I can highlight the following key differences:
1) There is a visual distinction between the different logical sections of the schema (e.g., sales, ordering, HR, etc.) using color coding.
2) Fields are organized with primary keys listed first, followed by foreign keys, and then the remaining columns.
3) The AdventureWorks schema includes a dedicated block for tracking logs and changes across the entire database.
4) Most tables have a ModifiedDate field to manage and track changes.
5) The AdventureWorks schema is more complex, providing greater detail and serving both operational and functional purposes.

Structurally, I think organizing fields by placing primary and foreign keys first makes sense. I also like the idea of tracking changes and logs within my database to reduce the risk of errors or data loss, allowing us to trace modifications. Specifically, for the order and sales tables, I would suggest including the actual transaction amounts to account for potential discounts or rebates.

# Criteria

[Assignment Rubric](./assignment_rubric.md)

# Submission Information

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

### Submission Parameters:
* Submission Due Date: `September 28, 2024`
* The branch name for your repo should be: `model-design`
* What to submit for this assignment:
    * This markdown (design_a_logical_model.md) should be populated.
    * Two Entity-Relationship Diagrams (preferably in a pdf, jpeg, png format).
* What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pull/<pr_id>`
    * Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:
- [ ] Create a branch called `model-design`.
- [ ] Ensure that the repository is public.
- [ ] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [ ] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack at `#cohort-4-help`. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.

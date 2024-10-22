### Frontend-Backend Separated E-Book System
**Repository:** [github.com/songyang8964/Wiki](https://github.com/songyang8964/Wiki)  
**Technology Stack:** 
- Spring Boot
- Vue.js
- TypeScript
- Redis
- Docker
- MySQL
- Nginx
- AWS EC2

**Key Features:**
- **Frontend Development:** Built using Vue.js, integrated with Ant Design and a rich text editor.
- **Single Sign-On (SSO):** Implemented with Redis and JWT, enhancing security and user convenience.
- **Management Systems:** Developed eBook, category, and user management systems using Spring Boot and MyBatis to improve functionality and user experience.
- **Deployment:** 
  - Deployed MySQL and Redis on AWS EC2 with Docker.
  - Hosted the frontend with Nginx.
  - Created a shell script to maintain continuous operation of the Jar package on the server, ensuring uninterrupted service.
  
+ <font style="color:rgb(31, 35, 40);">(1) Home. Use Ant Design to display the list in the left sidebar so that you can directly display the course categories one by one, click All to see the course categories in the main content.</font>

![](https://cdn.nlark.com/yuque/0/2024/png/40527046/1729604131232-1aba7a36-639f-455a-bf0e-c5742035c609.png)
![](https://cdn.nlark.com/yuque/0/2024/png/40527046/1729604197733-68693ce3-af32-4687-b565-84df1089d4e3.png)
![](https://cdn.nlark.com/yuque/0/2024/png/40527046/1729604213130-f33848cc-e3b7-4e7c-a870-a7d5ba06849d.png)
+ <font style="color:rgb(31, 35, 40);">(2) User query. Click on the user management, jump to the page, the user all query, and page display, enter in the input box, click on the query, then realize the fuzzy query.</font>
![](https://cdn.nlark.com/yuque/0/2024/png/40527046/1729604256265-7554610c-7257-485a-b402-01dfec77c9d7.png)
![](https://cdn.nlark.com/yuque/0/2024/png/40527046/1729604242548-4197d482-0939-4a13-93dc-846a6cc0bcd5.png)
+ (3) User addition. Add a user to be added to the database by connecting to the back-end.
+ (4) Password reset. Users can change their password, encrypted by MD5.
+ (5) User Edit. Edit the user's basic information.
+ (6) User Delete. Delete user information.
+ (7) Content Query. Click Content Management to query all of them once, enter them in the input box and click Query for fuzzy query.
![](https://cdn.nlark.com/yuque/0/2024/png/40527046/1729604286756-c818e651-3643-48d0-a90a-e86198f33f79.png)
+ (8) Content addition. Use the mimic box to display the basic information of the content, fill in the basic information of the content to add.
+ (9) Document management. Writing course documents.
![](https://cdn.nlark.com/yuque/0/2024/png/40527046/1729604448246-2dc3e00f-c4a2-41ef-b0b4-61415a5c2224.png)
+ (10) Content editing. Edit the basic content of the document.
+ (11) Content Delete. Delete this document.
+ (12) Category Add. Add a new course.
+ (13) Category Edit. Modify the course name, its parent category, and modify the sorting.
![](https://cdn.nlark.com/yuque/0/2024/png/40527046/1729604515309-27c5d2be-c817-4466-af87-fd548743ca32.png)
![](https://cdn.nlark.com/yuque/0/2024/png/40527046/1729604536362-6b136c81-0ad4-48d1-af5d-7e11db71725d.png)
+ (14) Category Deletion. Deletes a course.
+ (15) Course Documentation. View course documents and study the course.
![](https://cdn.nlark.com/yuque/0/2024/png/40527046/1729604490253-3369972f-2f08-433f-8ffd-82a454c2295d.png)
![](https://cdn.nlark.com/yuque/0/2024/png/40527046/1729604464240-5c01aeb0-389b-4b9e-9cf0-b8335f295afd.png)
+ <font style="color:rgb(31, 35, 40);">(16) About</font>
![](https://cdn.nlark.com/yuque/0/2024/png/40527046/1729604559797-9399ead0-8682-43a0-be54-406f5ff826c6.png)
+ <font style="color:rgb(31, 35, 40);">(17) Log out of the system. Clear the token and return to the login screen.</font>


 


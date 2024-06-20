<template>
  <div class="about">
    <h1>Key Technical Points</h1>
    <ul>
      <li><strong>Axios</strong>: Solving communication issues in a front-end and back-end separation architecture.</li>
      <li><strong>AOP</strong>: Logging.</li>
      <li><strong>RocketMQ and WebSocket</strong>: Implementing asynchronous message notifications.</li>
      <li><strong>ECharts</strong>: Data visualization and statistics.</li>
      <li><strong>Scheduled Tasks</strong>: Design and implementation.</li>
      <li><strong>Redis</strong>: Storing user tokens and login validation.</li>
      <li><strong>Ant Design for Vue</strong>: Building the front-end interface.</li>
      <li><strong>Environment Configuration</strong>: Separate configurations for development and production.</li>
      <li><strong>Unified Exception Handling</strong>: Centralized error management.</li>
      <li><strong>Interceptors and Filters</strong>: Request and response management.</li>
    </ul>
    <h2>Main Features</h2>
    <ul>
      <li><strong>User Management</strong></li>
      <li><strong>E-book Management</strong></li>
      <li><strong>Document Management</strong></li>
      <li><strong>Category Management</strong></li>
      <li><strong>Integration of Rich Text Editors</strong></li>
      <li><strong>Graphical Statistical Report Display</strong></li>
    </ul>
    <p>This project was created by Song Yang.</p>
    <div class="social-links">
      <a href="https://github.com/Jansson8964" target="_blank">GitHub</a>
      <a href="https://linkedin.com/in/song-yang-37aa29291/" target="_blank">LinkedIn</a>
    </div>
  </div>
</template>

<style scoped>
.about {
  font-family: 'Arial', sans-serif;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  max-width: 800px;
  margin: 0 auto;
}

.about h1,
.about h2 {
  color: #333;
  margin-bottom: 20px;
}

.about h1 {
  font-size: 28px;
  font-weight: bold;
}

.about h2 {
  font-size: 22px;
  font-weight: bold;
  margin-top: 30px;
  margin-bottom: 15px;
}

.about ul {
  list-style-type: none;
  padding: 0;
}

.about ul li {
  font-size: 18px;
  margin: 10px 0;
  color: #555;
  line-height: 1.6;
  display: flex;
  align-items: center;
}

.about ul li::before {
  content: '•';
  color: #000;
  font-weight: bold;
  display: inline-block;
  width: 1em;
  margin-left: -1em;
}

.about ul li strong {
  color: #000;
}

.about p {
  font-size: 16px;
  margin-top: 30px;
  color: #777;
  text-align: center;
}

.social-links {
  text-align: center;
  margin-top: 20px;
}

.social-links a {
  margin: 0 10px;
  font-size: 18px;
  color: #1a0dab;
  text-decoration: none;
}

.social-links a:hover {
  text-decoration: underline;
}
</style>

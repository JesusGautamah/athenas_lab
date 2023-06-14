# Athenas Lab & AI
Available at: [athenas-lab.com](https://athenas-lab.com)

This is a repository for the Athenas Lab & AI project. It contains the code for the website, discord and telegram bots with chatgpt.

The website is a Rails application,

the bots are written in ruby and was generated with [Chatgpt Assistant](https://github.com/JesusGautamah/chatgpt_assistant)

## The project
  This project is a university project for the subject of Interactive Systems, the objective of the project is to create a website where

  users can interact with bots and see the results of the bots in a dashboard, the dashboard also contain AI functionality to help the users with their projects.

## Table of Contents
  - [Requirements](#requirements)
  - [Installation](#installation)
  - [Contributing](#contributing)

## Requirements
  - Ruby
  - Docker
  - Docker Compose
  - IBM Watson Account
  - AWS Account
  - Discord Bot Token
  - Telegram Bot Token
  - OpenAI API Key

## Installation
  Edit the `.env` file with the correct values for the environment variables.

  Build the docker images with `docker-compose build`

  Run the migrations with `docker-compose run --rm web rails db:migrate`

  The server can be started with `docker-compose up` and stopped with `docker-compose down`

  localhost is mapped to port 80, so the website can be accessed at `localhost`

## Contributing
  This project is open to contributions, feel free to open a pull request or an issue.

### A project by
#### Beatriz Siqueira
  - [Github](https://github.com/Siqueirabiaa)
#### Bianca Pacheco
  - [Github](https://github.com/byanca04)
#### Gabriel Justino
  - [Github](https://github.com/Jottazy)
#### Igor Lima
  - [Github](https://github.com/JesusGautamah)
#### Maico Barbosa
  - [Github](https://github.com)
#### Rosario Pacheco
  - [Github](https://github.com)

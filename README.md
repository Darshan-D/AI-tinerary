# AI-tinerary

AI-tinerary is an iOS application that leverages the power of Large Language Models (LLMs), specifically Google's Gemini Pro, to generate personalized travel itineraries.  Users provide their travel preferences, including interests, budget, duration, and desired trip type, and AI-tinerary crafts unique and tailored itineraries.

## Outputs
| Home screen | Input screen |
|---|---|
| ![homeScreen](https://github.com/user-attachments/assets/59688b03-ad96-4a5b-9451-b6612b56a741) | ![enterDetailScreen](https://github.com/user-attachments/assets/8464979e-d05c-46ab-a682-ab2c0f2feb8f) |
| Loading screen | Generated content |
| ![loadingScreen](https://github.com/user-attachments/assets/e2f686f6-9453-4060-9bf7-266347c33597) | ![generatedContent](https://github.com/user-attachments/assets/6300c994-3b9f-4d0a-9d6d-ebc5c7e51071) |

## Features

* **AI-Powered Itinerary Generation:**  Uses Gemini Pro to create customized itineraries based on user input.
* **Lottie Animation:**  Uses Lottie animation library to give a sleek loading screen animation.
* **Flexible Input:** Accepts various travel preferences, such as destination, number of travel days, budget, and trip type (e.g., solo, partner, family).
* **JSON Handling:**  Demonstrates how to effectively send data (encoded as JSON strings) within prompts to Gemini Pro and decode the JSON responses from the LLM back into Swift data structures.
* **Modern iOS Development:** Built using Swift and demonstrates best practices for interacting with LLM APIs in an iOS environment.
* **Clear and Concise Code:**  The project is structured for easy understanding and modification.

## Technologies Used

* Swift
* Google Generative AI library
* Lottie Library
* JSON Encoding/Decoding
* Auto Layout
* UIKit

## Usage

1. Launch the app.
2. Enter your travel preferences on the input screen.
3. Tap the "Generate Itinerary" button.
4. The app will send the preferences to Gemini Pro and display the generated itineraries.

## API Key

You will need a Gemini Pro API key to run this project.
Once generated, add this API key in `GenerativeAI-Info.plist`

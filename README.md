# Bedtime Story Generator

## Overview

This tool is intended to help parents and guardians think up story or story ideas for children. You can request a prompt from previously loaded up keywords, an entire story or even feed your own keywords to the word bank - be they a descriptor, a character, a scenario, an action. This is meant to make it easier for guardians to make original stories each night with the possibility of incorporating the child's favorite characters and environments.

## Installation

To use this tool, you need to have Swift installed on your system. Once Swift is installed, follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the directory where you cloned the repository.
3. Build the project using the Swift Package Manager:

`swift build`

4. Once the project is built successfully, you can run the tool by executing the generated executable.

## Usage

This tool provides several subcommands:

- `add`: Add keywords to the word bank. Especify the type of word and then the one you want to add.
  
      ./bedtime add -c unicorn
- `story`: Generate an entire bedtime story. You can choose among 3 lengths of story and 3 age ranges for the child.
  
      ./bedtime story -l short a- preschooler
- `prompt`: Request a prompt from previously loaded keywords.

      ./bedtime prompt
- `list`: List all the keywords currently in the word bank.

      ./bedtime list
- `remove`: Remove keywords from the word bank. Especify the type of word and then the one you want to delete.

        ./bedtime remove -c unicorn

To use any of these subcommands, run the generated executable followed by the desired subcommand.

**Note:** Ensure that you have included your Google API key in the `GenerativeAI-Info.plist` file for the tool to function properly.

## Contributing

We welcome contributions from the community! If you'd like to contribute to the development of this tool, please follow these steps:

1. Fork the repository to your own GitHub account.
2. Create a new branch with a descriptive name for your feature or fix.
3. Make your changes and commit them with clear commit messages.
4. Push your changes to your fork.
5. Submit a pull request to the main repository, explaining the changes you've made and why they're valuable.

## Like this Tool?

If you find this tool useful, please consider starring the repository on GitHub to show your support!

## Team

This tool was made by [Raissa Parente](https://github.com/raissaparente) and Felipe Frances as part of a CLI challenge at Apple Developer Academy - IFCE.

## Credits

This tool utilizes the Swift Argument Parser library for command-line argument parsing. For more information about the Swift Argument Parser library, visit [here](https://swiftpackageindex.com/apple/swift-argument-parser/documentation).

Additionally, it uses GoogleGenerativeAI for generating creative story content.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

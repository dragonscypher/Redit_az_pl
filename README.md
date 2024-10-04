# Redit_az_pl 🚀

Welcome to **Redit_az_pl**, where we vibe with data and churn out the feels from Reddit comments like no other! 🎉 This project uses Azure Data Factory to analyze sentiment in Reddit comments because, you know, we gotta keep up with what's lit 🔥 and what's not. 😒

## What's This All About? 🤔

**Redit_az_pl** is all about digging deep into those Reddit comment vibes. We take a massive CSV file filled with comments, and then:
- Extract data (just the juicy bits like sentiment scores and IDs).
- Analyze to see how many peeps are feeling good (positive) or kinda meh (negative).
- Output the results so we can all see what's trending on the emotional radar of Reddit.

## How to Get This Party Started? 🎉

You wanna run this project? Bet! Follow these steps to get it popping:

### Prerequisites

Make sure you have these installed:
- Terraform
- Azure CLI (cuz we're doing it cloud-style, you feel?)

### Setup and Running

1. **Clone this repo**: Git clone and chill. Open your terminal and hit it:

    ```bash
    git clone https://your-repository-link.com
    cd Redit_az_pl
    ```

2. **Initialize Terraform**:

    ```bash
    terraform init
    ```

3. **Modify `terraform.tfvars`**:

    Yo, don't forget to add your Azure specifics here like your `source_container_name` and all that jazz.

4. **Apply Terraform**:

    Let Terraform do its thang:

    ```bash
    terraform apply
    ```

    Confirm with a `yes` when it asks unless you wanna bail. 🏃💨

5. **Check Out the Results**:

    Once everything’s done, peep the output files in your Azure Blob Storage. Results should be there waiting like your next Uber Eats order. 🍔📦

## Contributing

Wanna contribute? Sweet! Just fork this repo, create your feature branch, and submit a pull request. Make sure your code is fresh and your commits are clear.

## Issues

Got a problem? Post an issue. Keep it 💯 and we’ll sort it out together.

## License

This project is thrown out there under the MIT License - do what you want with it, but keep it legit. Check out the LICENSE file for more deets.

---

**Redit_az_pl** - Keeping it real with data, one sentiment at a time! 😎📊

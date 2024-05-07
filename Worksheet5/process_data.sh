# Initialize counters for each category
music_count=0
entertainment_count=0
gaming_count=0
comedy_count=0

# Loop through each line of the dataset
while IFS=, read -r rank youtuber subscribers video_views category title uploads country abbreviation channel_type video_views_rank country_rank channel_type_rank video_views_for_the_last_30_days lowest_monthly_earnings highest_monthly_earnings lowest_yearly_earnings highest_yearly_earnings subscribers_for_last_30_days created_year created_month created_date Gross_tertiary_education_enrollment Population Unemployment_rate Urban_population Latitude Longitude; do
    # Check if the line contains "United States"
    if [ "$country" = "United States" ]; then
        # Increment the counter for the respective category
        case "$category" in
            Music)
                music_count=$((music_count + 1))
                ;;
            Entertainment)
                entertainment_count=$((entertainment_count + 1))
                ;;
            Gaming)
                gaming_count=$((gaming_count + 1))
                ;;
            Comedy)
                comedy_count=$((comedy_count + 1))
                ;;
            *)
                # Ignore other categories
                ;;
        esac
        
        # Redirect the entry to its respective category file
        echo "$rank,$youtuber,$subscribers,$video_views,$category,$title,$uploads,$country,$abbreviation,$channel_type,$video_views_rank,$country_rank,$channel_type_rank,$video_views_for_the_last_30_days,$lowest_monthly_earnings,$highest_monthly_earnings,$lowest_yearly_earnings,$highest_yearly_earnings,$subscribers_for_last_30_days,$created_year,$created_month,$created_date,$Gross_tertiary_education_enrollment,$Population,$Unemployment_rate,$Urban_population,$Latitude,$Longitude" >> "Worksheet 5/United States/$category.txt"
    fi
done < 'Global YouTube Statistics.csv'

# Output the counts to ws5.txt
echo "Music: $music_count" >> ws5.txt
echo "Entertainment: $entertainment_count" >> ws5.txt
echo "Gaming: $gaming_count" >> ws5.txt
echo "Comedy: $comedy_count" >> ws5.txt


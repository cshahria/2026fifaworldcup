# 1. Change the current working directory to your local folder
cd "C:\Users\cyrus\OneDrive\99. Archive\Old\Documents\2026\FIFA\June_Journal\2026fifaworldcup\June_11"

# 2. Create the list array
$files = @(
	"file '2026_061139_1.mp4'"
	"file '2026_061139_2.mp4'"
	"file '2026_061139_3.mp4'"
	"file '2026_061139_4.mp4'"

		
)

# 3. Write out using New-Item to ensure it is raw UTF-8 without hidden BOM characters
[System.IO.File]::WriteAllLines((Get-Item .).FullName + "\inputs.txt", $files)

# 4. Run FFmpeg to append the files together seamlessly
ffmpeg -f concat -safe 0 -i inputs.txt -c copy clip.mp4

# 5. Clean up the temporary text file
Remove-Item "inputs.txt"
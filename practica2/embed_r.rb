require 'find'

# Function to include code into the Markdown document
def include_code(markdown_file_path)
  # Read the content of the Markdown file
  content = File.read(markdown_file_path)

  # Regular expression to match the placeholders
  pattern = /\{\{include: (.+?)\}\}/

  # Find and replace placeholders with the script content
  content.gsub!(pattern) do |match|
    r_script_path = Regexp.last_match(1) # Capture the script path from the placeholder
    if File.exist?(r_script_path)
      r_content = File.read(r_script_path)
      # Wrap the script content in Markdown code blocks
      "```matlab\n#{r_content}\n```"
    else
      puts "File not found: #{r_script_path}"
      match # Return the original placeholder if file not found
    end
  end

  # Write the modified content to a new file or overwrite the original
  new_file_path = markdown_file_path.sub('.md', '_with_r.md')
  File.write(new_file_path, content)
end

# Example usage
include_code('informe.md')

import subprocess
import re
import os
import glob

def split_markdown_by_chapter(file_path):
    # 遍历目录中的所有 .md 文件
    for markdown_file in glob.glob(os.path.join(file_path, '*.md')):
        # 读取文件内容
        with open(markdown_file, 'r', encoding='utf-8') as file:
            content = file.read()
        
        # 使用正则表达式匹配章节标题
        chapter_pattern = re.compile(r'^##\s+(\d+)\s+(.+)$', re.MULTILINE)
        chapters = chapter_pattern.split(content)
        
        # 处理引言部分
        if chapters:
            introduction = chapters[0].strip()
            if introduction:
                introduction_title = re.search(r"# Chapter \d+\.\s*(.*)\n", introduction).group(1)
                introduction_content = re.search(r"(?<=\n).*", introduction, re.DOTALL).group(0)
                introduction_content = introduction_content.strip()
                file_name = '-'.join(introduction_title.lower().split())

                # 写入新文件
                with open(os.path.join(output_folder, f"{file_name}.md"), 'w', encoding='utf-8') as new_file:
                    new_file.write(introduction_content)
        
        # 处理每个章节
        for i in range(1, len(chapters), 3):
            chapter_number = chapters[i]
            chapter_title = chapters[i+1].strip()
            chapter_content = chapters[i+2].strip()
            chapter_content = '# ' + chapter_title + '\n\n' + chapter_content
            
            # 转换文件名
            file_name = '-'.join(chapter_title.lower().split())
            # file_name = file_name.replace('##', '').strip()
            
            # 写入新文件
            with open(os.path.join(output_folder, f"{file_name}.md"), 'w', encoding='utf-8') as new_file:
                new_file.write(chapter_content)
    
    print("文件已经按照章节划分完成。")

def convert_markdown_to_typst(markdown_file):
    # 获取不带扩展名的文件名
    base_name = os.path.splitext(markdown_file)[0]
    typst_file = f"{base_name}.typ"

    # 处理公式编号
    with open(markdown_file, 'r', encoding='utf-8') as file:
        content = file.read()
    new_content = re.sub(r'\\tag\{(\d+)\}\n\$\$', r'\n$$(eq:\1)', content)

    # 将处理后的内容写入临时文件
    temp_md_file = 'temp_content.md'
    with open(temp_md_file, 'w', encoding='utf-8') as file:
        file.write(new_content)
    
    # 使用 Pandoc 将 Markdown 转换为 Typst
    subprocess.run(['pandoc', '-f', 'markdown', '-t', 'typst', '--wrap=none', '-o', typst_file, temp_md_file], check=True)

    # 删除临时文件（可选）
    os.remove(temp_md_file)
    
    return typst_file

def replace_content(text):
    # 定义替换规则
    rules = [
        (r'\(eq:(\d+)\)', r'<eq:\1>'),
        (r'parallel (.*?) parallel', r'norm(\1)'),
        (r'lr\(\|(.*?)\|\)', r'abs(\1)'),
        (r',([a-zA-Z0-9])', r', \1'),
        (r'mat\(delim: "\|\|", (.*?)', r'norm(\1'),
        (r'#h\(0em\) upright\(" for "\) #h\(0em\)', r'quad "for"'),
        (r'#h\(0em\) upright\(" for "\)', r'quad "for"'),
        (r'’', r"'")
    ]

    # 应用替换规则
    for pattern, repl in rules:
        text = re.sub(pattern, repl, text)
    
    return text

def process_files(directory):
    # 遍历目录中的所有 .md 文件
    for markdown_file in glob.glob(os.path.join(directory, '*.md')):
        # 转换 Markdown 文件到 Typst
        typst_file = convert_markdown_to_typst(markdown_file)

        # 读取转换后的 Typst 文件内容
        with open(typst_file, 'r', encoding='utf-8') as file:
            content = file.read()

        # 执行替换
        new_content = replace_content(content)

        # 保存结果到新的 Typst 文件
        output_file = f"{os.path.splitext(markdown_file)[0]}.typ"
        with open(output_file, 'w', encoding='utf-8') as file:
            file.write(new_content)

        print(f"已处理 {markdown_file}，结果保存到 {output_file}")

        # 删除 markdown 文件
        os.remove(markdown_file)

# 处理当前目录下的所有 Markdown 文件
directory = os.getcwd()
if 'scripts' not in directory:
    directory = os.path.join(directory, 'scripts')

# 输出目录
output_folder = os.path.join(directory, "output")

# 检查并创建输出文件夹
if not os.path.exists(output_folder):
    os.makedirs(output_folder)

# 遍历目录中的所有 .md 文件
split_markdown_by_chapter(directory)

# print(script_directory)
process_files(output_folder)

print("所有 Markdown 文件处理完成")

"""Make hyphens in the built PDF extract as a plain "-".

Source Sans Pro maps its hyphen glyph to U+2011, which ATS keyword search
does not match. This rewrites only the PDF's text layer; it looks the same.
"""
import re
import sys

import pikepdf

path = sys.argv[1]
pdf = pikepdf.open(path, allow_overwriting_input=True)
changed = 0
for obj in pdf.objects:
    if isinstance(obj, pikepdf.Dictionary) and '/ToUnicode' in obj:
        data = obj.ToUnicode.read_bytes()
        new = re.sub(rb'<(2010|2011)>', b'<002D>', data)
        if new != data:
            obj.ToUnicode.write(new)
            changed += 1
if changed:
    pdf.save(path)
print(f'fix_hyphens: rewrote {changed} font text map(s)')

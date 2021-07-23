import json
import gzip
import sys
import glob
from tqdm import tqdm

f = sys.argv[1] 

limit = 5
for i, jsonl in tqdm(enumerate(gzip.open(f, "rt"))):
    jsonl = json.loads(jsonl)

    if i%2==0:
        if "index" in jsonl:
            doc_id = jsonl["index"]["_id"] if "index" in jsonl else None
    else:
        doc_text = jsonl["text"]
        if doc_id is not None:
            print("%s\t%s"%(doc_id, doc_text.replace("\t","")))


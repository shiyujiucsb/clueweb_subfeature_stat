import sys
assert len(sys.argv) == 3
qset_filename = sys.argv[1]
data_filename = sys.argv[2]
query_length_lines = [[] for _ in range(100)]

file_qset = open(qset_filename, 'r')
qid_length = {}
for line in file_qset:
  qid, length = line.split("\t")
  qid_length[qid] = length
file_qset.close()
file_data = open(data_filename, 'r')
for line in file_data:
  qid_term = line.split(' ')[1]
  assert "qid:" in qid_term
  qid = qid_term[4:]
  length = qid_length[qid]
  query_length_lines[int(length)].append(line)
file_data.close()

for i in range(1, 100):
  if len(query_length_lines[i]) == 0: continue
  file_to_write = open(str(i)+"word_query_results.txt", "w")
  for line in query_length_lines[i]:
    file_to_write.write(line)
  file_to_write.close()



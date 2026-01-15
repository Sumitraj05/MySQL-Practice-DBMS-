SELECT w1.id from weather w1 
JOIN weather w2 ON 
DATEdiff(w1.recordDate,w2.recordDate)=1 and
w1.temperature>w2.temperature;

# Zhihu_Questions_with_Date_ID

This repo is to
list the [知乎(zhihu)](zhihu.com) questions whose ID is a date, e.g. today `20150407`.

According to the answer to the question [知乎上的第一个问题是什么？](http://www.zhihu.com/question/20415740), the first ID of Zhihu questions is `19550225`. However, the ID number of the questions are not continuous, with a random interval from `1` to `4`.[^1] So I import the library ` RCurl` and use

```
url.exists(Q_url)
```

to check if the "date ID" is valid.

After outputting the raw result, I further tidied it up into `.md` format with

```
for_md <- paste0(Zhihu_Questions$QID," | [", Zhihu_Questions$Question,"](http://www.zhihu.com/question/", Zhihu_Questions$QID, ")")
write(formd, file = "result.md")
```
Then I opened the `.md` file and add the column names

```
ID (Date) | Question
--------- | --------
```


[^1]: [【「知乎一号问题」的编号为何是19550225？这是在向1955年2月24日出生的乔布斯致敬吗？】匿名用户的回答](http://zhi.hu/iYRW)




# Copyright 2015 Bluek404
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import httpclient, json

const url = "http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=8"

proc findLast(a:string, item:char): int =
  for i in countdown(a.len-1, 0):
    if a[i] == item:
      return i

var data = parseJson(getContent(url))

for img in data["images"]:
  var
    imgURL = img["url"].str
    imgName = imgURL[findLastString(imgURL, '/') + 1 .. imgURL.len]

  writeFile(imgName, getContent(imgURL))
  echo(imgName)

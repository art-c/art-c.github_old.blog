---
layout  : wiki
title   : 
summary : 
date    : 2020-02-25 00:42:24 +0900
updated : 2020-02-25 01:13:48 +0900
tag     : 
toc     : true
public  : true
parent  : 
latex   : false
---
* TOC
{:toc}

# 설치
* yarn add material-ui
* example
	- `TypeError: Cannot read property ‘prepareStyles’ of undefined`
```
import React from "react";
import MuiThemeProvider from "material-ui/styles/MuiThemeProvider";
import { TextField } from "material-ui";

const CheckResion = () => (
  <MuiThemeProvider>
    <div>
      <TextField />
      <TextField />
    </div>
  </MuiThemeProvider>
);

export default CheckResion;

```

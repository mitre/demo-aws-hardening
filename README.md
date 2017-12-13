# aws-demo-hardening
A kitchen-terraform based example of building and validating AWS security settings

Note:

You will need to set the following env_vars for this to work.

`AWS_...=<your...>`
`AWS_... `

Then Run:

`kitchen create && kitchen converge && kitchen verify && kitchen destroy`

or 

`kitchen test --destroy=always`


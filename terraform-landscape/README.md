# terraform-landscape

#### Terraform Landscape is a tool for reformatting the output of `terraform plan` to be easier to read and understand.

#### Before
<div align="left">
    <img src="figures/terraform-landscape-before.png" alt="drawing" width="650"/>
</div>

#### After
<div align="left">
    <img src="figures/terraform-landscape-after.png" alt="drawing" width="650"/>
</div>

## Docker Usage

Build the docker image using provided Dockerfile and use it directly:

```bash
docker build . -t landscape
terraform plan ... | docker run -i --rm landscape
```
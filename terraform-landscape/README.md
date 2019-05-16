# terraform-landscape

#### Terraform Landscape is a tool for reformatting the output of `terraform plan` to be easier to read and understand.

#### Before
<div align="left">
    <img src="../figures/terraform-landscape-before.png" alt="drawing" width="900"/>
</div>

#### After
<div align="left">
    <img src="../figures/terraform-landscape-after.png" alt="drawing" width="900"/>
</div>

## Docker Usage

Build the docker image using provided Dockerfile and use it directly:

```bash
terraform plan ... | docker run -i --rm binbash/terraform-landscape
```
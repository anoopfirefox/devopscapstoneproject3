resource "aws_eks_cluster" "capstone_prd_ekscluster" {
  name     = "capstone-ekscluster"
  role_arn = aws_iam_role.capstone_ekscluster.arn
  vpc_config {
    subnet_ids = [aws_subnet.capstonesubnet_a.id, aws_subnet.capstonesubnet_b.id]
    #subnet_ids = [aws_subnet.capstonesubnet_a.id, aws_subnet.capstonesubnet_b.id, aws_subnet.capstonesubnet_c.id]
  }
  tags = {
    Name = "Capstone-EKS-Cluster"
  }
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
  ]
}

resource "aws_eks_node_group" "node" {
  cluster_name    = aws_eks_cluster.capstone_prd_ekscluster.name
  node_group_name = "capstone_nodes"
  node_role_arn   = aws_iam_role.eks_nodes.arn
  subnet_ids      = [aws_subnet.capstonesubnet_a.id, aws_subnet.capstonesubnet_b.id]
  #subnet_ids      = [aws_subnet.capstonesubnet_a.id, aws_subnet.capstonesubnet_b.id, aws_subnet.capstonesubnet_c.id]
  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}




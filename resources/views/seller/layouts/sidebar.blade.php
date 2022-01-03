<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{route('seller')}}">
      <div class="sidebar-brand-icon rotate-n-15">
        <i class="fas fa-laugh-wink"></i>
      </div>
      <div class="sidebar-brand-text mx-3">Seller</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Bảng điều khiển -->
    <li class="nav-item active">
      <a class="nav-link" href="{{route('seller')}}">
        <i class="fas fa-fw fa-tachometer-alt"></i>
        <span>Bảng điều khiển</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Nav Item - Pages Collapse Menu -->
    <!-- Nav Item - Charts -->
    <li class="nav-item">
        <a class="nav-link" href="{{route('seller-file-manager')}}">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Quản lí tài nguyên</span></a>
    </li>
    <!-- Divider -->
    <hr class="sidebar-divider">
    {{-- Sản phẩm --}}
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#productCollapse" aria-expanded="true" aria-controls="productCollapse">
          <i class="fas fa-cubes"></i>
          <span>Sản phẩm</span>
        </a>
        <div id="productCollapse" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="{{route('product.index')}}">Sản phẩm</a>
            <a class="collapse-item" href="{{route('product.create')}}">Thêm Product</a>
          </div>
        </div>
    </li>


    <!-- {{-- Vận chuyển --}}
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#shippingCollapse" aria-expanded="true" aria-controls="shippingCollapse">
          <i class="fas fa-truck"></i>
          <span>Vận chuyển</span>
        </a>
        <div id="shippingCollapse" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="{{route('shipping.index')}}">Vận chuyển</a>
          </div>
        </div>
    </li> -->

    <!--Đơn hàng -->
    <!-- <li class="nav-item">
        <a class="nav-link" href="{{route('order.index')}}">
            <i class="fas fa-hammer fa-chart-area"></i>
            <span>Đơn hàng</span>
        </a>
    </li> -->


    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Các bài đăng -->
    <!-- <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#postCollapse" aria-expanded="true" aria-controls="postCollapse">
        <i class="fas fa-fw fa-folder"></i>
        <span>Các bài đăng</span>
      </a>
      <div id="postCollapse" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <a class="collapse-item" href="{{route('post.index')}}">Các bài đăng</a>
          <a class="collapse-item" href="{{route('post.create')}}">Thêm Bài đăng</a>
        </div>
      </div>
    </li> -->

    <!-- Thanh sliderbar -->
    <div class="text-center d-none d-md-inline">
      <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>